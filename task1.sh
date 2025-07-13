#!/bin/bash

# Визначення масиву URL (останній сайт додано спеціально для перевірки ситуації, коли сайт недоступний)
websites=("https://google.com" "https://facebook.com" "https://twitter.com" "https://thissitedoesnotexist12345.com")

# Назва файлу логів
log_file="website_status.log"

# Очищення попереднього логу
> "$log_file"

# Перевірка кожного сайту
for site in "${websites[@]}"
do
  # Використання curl з обробкою переадресацій (-L) та виведенням лише коду (-o /dev/null -s -w "%{http_code}")
  http_code=$(curl -L -o /dev/null -s -w "%{http_code}" "$site")

  if [ "$http_code" -eq 200 ]; then
    echo "[$site]($site) is UP" | tee -a "$log_file"
  else
    echo "[$site]($site) is DOWN" | tee -a "$log_file"
  fi
done

# Завершальне повідомлення
echo "Результати перевірки записані у файл: $log_file"
