#!/bin/bash

send_msg() {
    notify-send "System Update" "$1" --icon=software-update-available-symbolic
}

# 1. Обновляем зеркала
sudo cachyos-rate-mirrors &&

# 2. Системные пакеты
send_msg "Этап 1: Официальные репозитории..."
sudo pacman -Syu --noconfirm --needed &&

# 3. AUR
# Добавляем --needed, чтобы не переустанавливать то, что уже актуально
# Флаг -Sua обновляет ТОЛЬКО AUR, не трогая системные базы повторно
send_msg "Этап 2: AUR пакеты..."
yay -Sua --noconfirm --needed --answerdiff=None --answeredit=None --answerclean=None &&

# 4. Flatpak
send_msg "Этап 3: Обновление Flatpak..."
flatpak update --assumeyes &&

# 4. Чистка: удаляем сирот и старый кэш (оставляем 2 версии для отката)
send_msg "Очистка системы..."
yay -Yc --noconfirm &&
sudo paccache -rk2 &&

# 6. Проверка необходимости перезагрузки
# Проверяем: файл-триггер CachyOS ИЛИ разницу в версиях ядра
if [ -f /var/run/reboot-required ] || [ "$(uname -r | cut -d- -f1)" != "$(pacman -Q linux-cachyos | awk '{print $2}' | cut -d- -f1)" ]; then
    send_msg "Требуется перезагрузка! Ребут через 10 секунд..."
    echo "Внимание: ядро или системные компоненты обновлены. Перезагрузка..."
    sleep 10
    reboot
else
    send_msg "Обновление завершено. Перезагрузка не требуется."
    echo "Система актуальна, ребут пропущен."
fi


