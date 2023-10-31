## Part 8. Готовый дашборд

### 1. Установить готовый дашборд Node Exporter Quickstart and Dashboard с официального сайта Grafana Labs

![image](./imgs/1.1.png)

![image](./imgs/1.2.png)


### 2. Провести те же тесты, что и в Части 7

- Запускаем bash-скрипт из Части 2

![image](./imgs/2.1.png)

![image](./imgs/2.2.png)

- Запускаем ``stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 10s``

![image](./imgs/3.1.png)

![image](./imgs/3.2.png)

### 3. Запустить ещё одну виртуальную машину, находящуюся в одной сети с текущей. Запустить тест нагрузки сети с помощью утилиты iperf3

![image](./imgs/4.1.png)

![image](./imgs/4.2.png)

### 4. Посмотреть на нагрузку сетевого интерфейса

![image](./imgs/4.3.png)