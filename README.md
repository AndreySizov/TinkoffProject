# TinkoffProject
Tinkoff School Middle iOS Project

## 1 дз
**Архитектура:** VIPER, component-based

**UI:** PinLayout

**GitFlow** - отбранчевывались от develop, делали таску, создавали PR и мерджили обратно. Достаточно одного аппрува, так как нас трое.


Сделали отдельный pod авторизации, подключили Swiftlint и R.swift в основное приложение и в зависимость

Создали проект с тасками в GitHub, ветки старались называть номерами задач (кроме каких-то фиксов)

Проводили Code Review, ограничение на один реквест в большинстве случаев - 300 добавлений

По итогам работы слили все в master, сделали ветку release и запушили tag ***release/1.0.0***

## Запуск
Алгоритм запуска проекта такой: делаем pod install, потом запускаем проект, ждем пока он упадет с "Build failed", потом еще раз делаем pod install
