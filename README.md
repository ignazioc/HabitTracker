Habit Tracker
============

**This:**

![](docs/paper_tracking.jpg)

**for him:**

![](docs/linux_geek.jpg)

## What you can do
Create a list of habits you want to track
```bash
$ ht add "Play Tennis"
```
If you like, you can schedule each habit,

```bash
#Try to play tennis on each Saturday and Sunday
$ ht add "Play Tennis" --schedule 6,0
```

have a reminder about what you should do today

```bash
$ ht today
Today you should do:
* Play Tennis
```

Track your activity
```bash
$ ht do
What did you do?
1. Play Tennis
2. Reading that book
?  2
When did you "Reading that book" the last time?
1. Today
2. Yesteday
3. Tue 31
4. Mon 30
5. Sun 29
6. Sat 28
?  1
Any notes?: "Alfred is not dead"
```

and print a nice output with all your activities

```bash
› bundle exec ht report
+-----+-------------+----------------------+
|                 February                 |
+-----+-------------+----------------------+
| Day | Play Tennis | Reading that book    |
+-----+-------------+----------------------+
| 01  |             |                      |
| 02  |             | "Alfred is not dead" |
| 03  |             |                      |
| 04  |             |                      |
| 05  |             |                      |
| 06  |             |                      |
| 07  |             |                      |
| 08  |             |                      |
| 09  |             |                      |
| 10  |             |                      |
| 11  |             |                      |
| 12  |             |                      |
| 13  |             |                      |
| 14  |             |                      |
| 15  |             |                      |
| 16  |             |                      |
| 17  |             |                      |
| 18  |             |                      |
| 19  |             |                      |
| 20  |             |                      |
| 21  |             |                      |
| 22  |             |                      |
| 23  |             |                      |
| 24  |             |                      |
| 25  |             |                      |
| 26  |             |                      |
| 27  |             |                      |
| 28  |             |                      |
+-----+-------------+----------------------+
```



## How to install
    gem install habittracker

## How to use it


```
  NAME:

    ht

  DESCRIPTION:

    Track your monthly habits

  COMMANDS:

    add    Add one or more habits to the list
    do     Record your activities
    habits Print the list of current habits
    help   Display global or [command] help documentation
    report Print the current month's activities
    rm     Remove one or more habits from the list
    today  Shows the list of habits you should do today

  GLOBAL OPTIONS:

    -h, --help
        Display help documentation

    -v, --version
        Display version information

    -t, --trace
        Display backtrace when an error occurs
```



