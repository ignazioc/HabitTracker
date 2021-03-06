class Archive
  def initialize
    @db_file = File.join(ENV['HOME'], '/.ht')
    load_archive
  end

  def add_habit(habit, days = [])
    from = Date.new(Time.now.year, 1, 1)
    to = Date.new(Time.now.year, 12, 31)

    @archive[habit] = from.upto(to).each_with_object({}) do |day, mem|
      mem[date_to_key(day)] = nil
      mem
    end
    @archive[habit][:schedule] = days

    store
    load_archive
  end

  def rm_habit(habit)
    @archive.delete(habit)
    store
    load_archive
  end

  def habits
    @archive.keys
  end

  def print_habits
    habits.each { |h| puts h }
  end

  def print_status(from, to)
    keys_to_print = from.upto(to).map { |day| date_to_key(day) }

    rows = keys_to_print.map do |day|
      row = [short_key(day)]

      habits.each do |habit|
        hits = @archive[habit]
        row << row_item(hits[day])
      end
      row
    end

    header = habits.unshift('Day')
    puts Terminal::Table.new title: Time.now.strftime('%B'), headings: header, rows: rows
  end

  def save(habit, date, note)
    calendar = @archive[habit]
    return if calendar.nil?

    key = date_to_key(date)
    calendar[key] = note.length > 0 ? note : "X"
    store
    load_archive
  end

  def habits_per_day(day)
    @archive.keys.select do |habit|
      @archive[habit][:schedule].include?(day)
    end
  end

  #-- Private Methods

  private def load_archive
    unless File.exist? @db_file
      File.open(@db_file, 'w') do |file|
        file.write({}.to_yaml)
      end
    end
    @archive = YAML.load_file(@db_file)
end

  private def store
    File.open(@db_file, 'w') do |file|
      file.write(@archive.to_yaml)
    end
  end

  private def date_to_key(date)
    date.strftime('%Y.%m.%d')
  end

  private def key_to_date(key)
    Date.strptime(key, '%Y.%m.%d')
  rescue
    return nil
  end

  private def short_key(key)
    key[-2..-1]
  end

  private def row_item(value)
    value ? { value: value, alignment: :center } : { value: '', alignment: :center }
  end
end
