## Part 7. Prometheus и Grafana

### 1. Установить и настроить Prometheus и Grafana на виртуальную машину

``sudo apt install prometheus``
``sudo systemctl start prometheus``
``sudo systemctl status prometheus``

![image](./imgs/1.1.png)

``wget https://dl.grafana.com/oss/release/grafana_9.2.4_amd64.deb``
``sudo apt install libfontconfig``
``sudo dpkg -i grafana_9.2.4_amd64.deb``
``sudo systemctl enable grafana-server``
``sudo systemctl start grafana-server``

![image](./imgs/1.2.png)

## 2. Получить доступ к веб интерфейсам с локальной машины 

![image](./imgs/2.1.png)

## 3. Добавить на дашборд Grafana отображение ЦПУ, доступной оперативной памяти, свободное место и кол-во операций ввода/вывода на жестком диске 

![image](./imgs/3.1.png)

## 4. Запустить ваш bash-скрипт из Части 2

![image](./imgs/4.1.png)

## 5. Посмотреть на нагрузку жесткого диска (место на диске и операции чтения/записи)

![image](./imgs/5.1.png)

## 6. Установить утилиту stress и запустить команду ``stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 10s``

![image](./imgs/6.1.png)

## 7. Посмотреть на нагрузку жесткого диска, оперативной памяти и ЦПУ

![image](./imgs/7.1.png)
