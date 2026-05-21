// Положи свой .exe в папку downloads/ (см. путь ниже)
const DOWNLOAD_FILE = "downloads/SoftBrainrot.exe";
const DOWNLOAD_NAME = "SoftBrainrot.exe";

function triggerDownload() {
  const link = document.createElement("a");
  link.href = DOWNLOAD_FILE;
  link.download = DOWNLOAD_NAME;
  link.style.display = "none";
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
  showToast("Скачивание началось: " + DOWNLOAD_NAME);
}

function showToast(message) {
  const toast = document.getElementById("toast");
  toast.textContent = message;
  toast.classList.add("show");
  setTimeout(() => toast.classList.remove("show"), 3000);
}

document.querySelectorAll(
  "#downloadBtn, #downloadBtnHero, #downloadBtnCta"
).forEach((btn) => {
  btn.addEventListener("click", triggerDownload);
});

// Галерея: подписи с реальным доходом из BRAINROTS
function initGalleryIncomes() {
  const grid = document.getElementById("galleryGrid");
  if (!grid || typeof BRAINROTS === "undefined") return;

  grid.querySelectorAll(".gallery-item[data-brainrot]").forEach((el) => {
    const b = BRAINROTS.find((x) => x.id === el.dataset.brainrot);
    if (!b) return;
    const incomeEl = el.querySelector(".gallery-income");
    if (incomeEl) {
      incomeEl.textContent =
        formatIncomePerSec(b.income) + " · покупка " + formatMoney(b.cost);
    }
    const em = el.querySelector("em");
    if (em) em.textContent = b.rarity;
    el.className = "gallery-item " + b.rarityClass;
  });
}

document.addEventListener("DOMContentLoaded", initGalleryIncomes);
