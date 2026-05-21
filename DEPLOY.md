# Как выложить сайт в интернет (бесплатно)

## Способ 1 — Netlify Drop (самый простой, ~2 минуты)

1. Открой в браузере: **https://app.netlify.com/drop**
2. Войди через Google / GitHub / почту (бесплатно).
3. Перетащи файл **`websaite-deploy.zip`** из папки `websaite` на страницу Drop.
4. Подожди загрузку — появится ссылка вида `https://случайное-имя.netlify.app`
5. **Свой адрес в стиле игры:** Site configuration → Domain management → **Options** → **Edit site name**
6. Введи, например (если свободно):
   - `brainrot-heist-soft` (рекомендуем)
   - `steal-brainrot-hub`
   - `softbrainrot-heist`

   Сайт будет: `https://brainrot-heist-soft.netlify.app`

7. Проверь кнопку **Скачать** — должен качаться `SoftBrainrot.exe`.

---

## Способ 2 — Cloudflare Pages

1. https://dash.cloudflare.com → **Workers & Pages** → **Create** → **Pages** → **Upload assets**
2. Загрузи `websaite-deploy.zip`
3. Имя проекта: `steal-brainrot-soft`
4. Адрес: `https://steal-brainrot-soft.pages.dev`

---

## Обновить сайт или exe

1. Замени `downloads/SoftBrainrot.exe`
2. Запусти `create-deploy-zip.ps1` — создаст новый zip
3. Снова загрузи zip на Netlify (Deploys → drag new zip) или Cloudflare

---

## Важно

- Файл **SoftBrainrot.exe** (~35 МБ) уже внутри архива — скачивание работает по HTTPS.
- Бесплатный домен `.com` (например `stealbrainrot.com`) — платный; бесплатно только `*.netlify.app` или `*.pages.dev`.
- Антивирус Windows может ругаться на `.exe` — это нормально для неподписанных программ.
