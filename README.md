# program_exam
# プログラミング試験_フィックスポイント

# Usage
## Execution

各設問の実行方法です。

```
$ ./setsumon_1.sh
$ ./setsumon_2.sh
$ ./setsumon_3.sh
$ ./setsumon_4.sh
```

## Making Test Log

テストログ作成方法です。

```
$ ./start_log.sh
```

## Requirement

実行環境です。

```
・Mac 10.15.7
・bash 3.2
・Python 3.9.9
・GNU Awk 5.1.1
```

# Installation
 
GNU Awk 5.1.1 のインストール方法です。

```gawk
brew install gawk
```

## Test Result

設問１のテスト結果です。
[Failure]はタイムアウト、[Recovery]は復旧を意味しています。

```
$ ./setsumon_1.sh
[Failure] Server address: 192.168.1.4/24, Date: 2021 12 05 23 41 16
[Failure] Server address: 192.168.1.1/24, Date: 2021 12 05 23 41 17
[Failure] Server address: 192.168.1.3/24, Date: 2021 12 05 23 41 18
[Failure] Server address: 192.168.1.5/24, Date: 2021 12 05 23 41 21
[Recovery] Server address: 192.168.1.4/24, Failure Time: 0 hours, 0 minutes, 7 seconds
[Recovery] Server address: 192.168.1.5/24, Failure Time: 0 hours, 0 minutes, 3 seconds
[Failure] Server address: 192.168.1.3/24, Date: 2021 12 05 23 41 34
[Failure] Server address: 192.168.1.1/24, Date: 2021 12 05 23 41 36
[Failure] Server address: 192.168.1.4/24, Date: 2021 12 05 23 41 37
[Failure] Server address: 192.168.1.1/24, Date: 2021 12 05 23 41 38
[Recovery] Server address: 192.168.1.3/24, Failure Time: 0 hours, 0 minutes, 5 seconds
[Failure] Server address: 192.168.1.2/24, Date: 2021 12 05 23 41 40
[Failure] Server address: 192.168.1.4/24, Date: 2021 12 05 23 41 41
[Failure] Server address: 192.168.1.1/24, Date: 2021 12 05 23 41 42
[Recovery] Server address: 192.168.1.2/24, Failure Time: 0 hours, 0 minutes, 3 seconds
[Failure] Server address: 192.168.1.4/24, Date: 2021 12 05 23 42 13
[Failure] Server address: 192.168.1.1/24, Date: 2021 12 05 23 42 14
[Recovery] Server address: 192.168.1.1/24, Failure Time: 0 hours, 0 minutes, 1 seconds
[Failure] Server address: 192.168.1.2/24, Date: 2021 12 05 23 42 16
[Failure] Server address: 192.168.1.4/24, Date: 2021 12 05 23 42 17
[Recovery] Server address: 192.168.1.2/24, Failure Time: 0 hours, 0 minutes, 3 seconds
[Failure] Server address: 192.168.1.5/24, Date: 2021 12 05 23 42 20
[Failure] Server address: 192.168.1.3/24, Date: 2021 12 05 23 42 21
[Failure] Server address: 192.168.1.3/24, Date: 2021 12 05 23 42 43
[Recovery] Server address: 192.168.1.5/24, Failure Time: 0 hours, 0 minutes, 24 seconds
[Failure] Server address: 192.168.1.4/24, Date: 2021 12 05 23 42 45
[Failure] Server address: 192.168.1.4/24, Date: 2021 12 05 23 42 47
[Failure] Server address: 192.168.1.4/24, Date: 2021 12 05 23 42 50
[Failure] Server address: 192.168.1.3/24, Date: 2021 12 05 23 42 51
[Failure] Server address: 192.168.1.2/24, Date: 2021 12 05 23 42 52
[Failure] Server address: 192.168.1.4/24, Date: 2021 12 06 00 21 37
[Failure] Server address: 192.168.1.5/24, Date: 2021 12 06 00 21 38
[Failure] Server address: 192.168.1.4/24, Date: 2021 12 06 00 21 39
[Recovery] Server address: 192.168.1.5/24, Failure Time: 0 hours, 0 minutes, 2 seconds
[Failure] Server address: 192.168.1.3/24, Date: 2021 12 06 00 21 41
[Failure] Server address: 192.168.1.4/24, Date: 2021 12 06 00 21 42
[Recovery] Server address: 192.168.1.4/24, Failure Time: 0 hours, 0 minutes, 1 seconds
[Recovery] Server address: 192.168.1.3/24, Failure Time: 0 hours, 0 minutes, 3 seconds
[Failure] Server address: 192.168.1.3/24, Date: 2021 12 06 00 21 45
[Failure] Server address: 192.168.1.3/24, Date: 2021 12 06 12 47 31
[Failure] Server address: 192.168.1.2/24, Date: 2021 12 06 12 47 33
[Failure] Server address: 192.168.1.4/24, Date: 2021 12 06 12 47 35
[Failure] Server address: 192.168.1.1/24, Date: 2021 12 06 12 47 36
[Failure] Server address: 192.168.1.5/24, Date: 2021 12 06 12 47 37
[Failure] Server address: 192.168.1.1/24, Date: 2021 12 06 12 47 38
[Failure] Server address: 192.168.1.1/24, Date: 2021 12 06 12 47 39
[Failure] Server address: 192.168.1.1/24, Date: 2021 12 06 12 47 40
[Failure] Server address: 192.168.1.5/24, Date: 2021 12 06 14 03 32
[Failure] Server address: 192.168.1.3/24, Date: 2021 12 06 14 03 33
[Recovery] Server address: 192.168.1.2/24, Failure Time: 1 hours, 16 minutes, 1 seconds
[Recovery] Server address: 192.168.1.3/24, Failure Time: 0 hours, 0 minutes, 2 seconds
[Failure] Server address: 192.168.1.5/24, Date: 2021 12 06 14 03 36
[Failure] Server address: 192.168.1.5/24, Date: 2021 12 06 14 03 37
[Failure] Server address: 192.168.1.3/24, Date: 2021 12 06 14 03 38
[Recovery] Server address: 192.168.1.1/24, Failure Time: 1 hours, 15 minutes, 59 seconds
[Recovery] Server address: 192.168.1.4/24, Failure Time: 1 hours, 16 minutes, 5 seconds
[Failure] Server address: 192.168.1.5/24, Date: 2021 12 06 14 03 41
[Recovery] Server address: 192.168.1.3/24, Failure Time: 0 hours, 0 minutes, 8 seconds
[Failure] Server address: 192.168.1.3/24, Date: 2021 12 06 14 03 48
[Failure] Server address: 192.168.1.5/24, Date: 2021 12 06 14 03 51
[Failure] Server address: 192.168.1.1/24, Date: 2021 12 06 14 03 54
```

設問２のテスト結果です。
```
brew install gawk
```
