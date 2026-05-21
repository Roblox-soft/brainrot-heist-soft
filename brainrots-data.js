/** Доход и цены — по вики Steal a Brainrot (stealabrainrot.fandom.com) */
const BRAINROTS = [
  {
    id: "noobini",
    name: "Noobini Pizzanini",
    image: "images/Noobini_Pizzanini.png",
    income: 1,
    cost: 25,
    rarity: "Common",
    rarityClass: "rarity-common",
  },
  {
    id: "trippi",
    name: "Trippi Troppi",
    image: "images/Trippi_Troppi.png",
    income: 15,
    cost: 2000,
    rarity: "Rare",
    rarityClass: "rarity-rare",
  },
  {
    id: "gangster",
    name: "Gangster Footera",
    image: "images/Gangster_Footera.png",
    income: 30,
    cost: 4000,
    rarity: "Rare",
    rarityClass: "rarity-rare",
  },
  {
    id: "cappuccino",
    name: "Cappuccino Assassino",
    image: "images/Cappuccino_Assassino.png",
    income: 75,
    cost: 10000,
    rarity: "Epic",
    rarityClass: "rarity-epic",
  },
  {
    id: "brr",
    name: "Brr Brr Patapim",
    image: "images/Brr_Brr_Patapim.png",
    income: 100,
    cost: 15000,
    rarity: "Epic",
    rarityClass: "rarity-epic",
  },
  {
    id: "odin",
    name: "Odin Din Din Dun",
    image: "images/Odin_Din_Din_Dun.png",
    income: 75000,
    cost: 15000000,
    rarity: "Brainrot God",
    rarityClass: "rarity-god",
  },
  {
    id: "vacca",
    name: "La Vacca Saturno Saturnita",
    image: "images/La_Vacca_Saturno_Saturnita.png",
    income: 325000,
    cost: 80000000,
    rarity: "Secret",
    rarityClass: "rarity-secret",
  },
  {
    id: "tralaleritos",
    name: "Los Tralaleritos",
    image: "images/Los_Tralaleritos.png",
    income: 500000,
    cost: 100000000,
    rarity: "Secret",
    rarityClass: "rarity-secret",
  },
  {
    id: "tung",
    name: "Tung Tung Tung Sahur",
    image: "images/Tung_Tung_Tung_Sahur.png",
    income: 1500000,
    cost: 500000000,
    rarity: "Secret",
    rarityClass: "rarity-secret",
  },
  {
    id: "skibidi",
    name: "Skibidi Toilet",
    image: "images/Skibidi_Toilet.png",
    income: 450000000,
    cost: 450000000000,
    rarity: "OG",
    rarityClass: "rarity-og",
  },
  {
    id: "strawberry",
    name: "Strawberry Elephant",
    image: "images/Strawberry_Elephant.png",
    income: 750000000,
    cost: 750000000000,
    rarity: "OG",
    rarityClass: "rarity-og",
  },
];

function formatMoney(n) {
  if (n >= 1e9) return "$" + (n / 1e9).toFixed(n % 1e9 === 0 ? 0 : 1) + "B";
  if (n >= 1e6) return "$" + (n / 1e6).toFixed(n % 1e6 === 0 ? 0 : 1) + "M";
  if (n >= 1e3) return "$" + (n / 1e3).toFixed(n % 1e3 === 0 ? 0 : 1) + "K";
  return "$" + n;
}

function formatIncomePerSec(income) {
  return formatMoney(income) + "/сек";
}

/** Кражи в демо — от средних до топовых */
const HEIST_BRAINROTS = [
  BRAINROTS.find((b) => b.id === "odin"),
  BRAINROTS.find((b) => b.id === "vacca"),
  BRAINROTS.find((b) => b.id === "tralaleritos"),
  BRAINROTS.find((b) => b.id === "tung"),
  BRAINROTS.find((b) => b.id === "skibidi"),
  BRAINROTS.find((b) => b.id === "strawberry"),
].filter(Boolean);
