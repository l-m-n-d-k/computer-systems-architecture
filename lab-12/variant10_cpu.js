// Вариант 10: Checker / grid, 3840x2160, cellsX=28, cellsY=18, lineWidth=0.08
// Тело функции для редактора "Код CPU (JavaScript)".
// Доступны x, y, width, height, uvx, uvy, cx, cy, rgba(), mix() и др.
const cellsX = 28.0;
const cellsY = 18.0;
const lineWidth = 0.08;

// формула (12.6): индексы клетки и локальные координаты внутри клетки
const gx = uvx * cellsX;
const gy = uvy * cellsY;
const ix = Math.floor(gx);
const iy = Math.floor(gy);
const fx = gx - ix;
const fy = gy - iy;

// чётность суммы индексов задаёт цвет клетки
const tile = (ix + iy) % 2;

// линия сетки: расстояние до ближайшей стороны клетки меньше половины толщины
const d = Math.min(Math.min(fx, 1.0 - fx), Math.min(fy, 1.0 - fy));
const line = d < lineWidth * 0.5 ? 1.0 : 0.0;

const light = [0.93, 0.95, 0.98];
const dark = [0.15, 0.25, 0.45];
const lineColor = [0.95, 0.35, 0.10];

const r = mix(mix(light[0], dark[0], tile), lineColor[0], line);
const g = mix(mix(light[1], dark[1], tile), lineColor[1], line);
const b = mix(mix(light[2], dark[2], tile), lineColor[2], line);
return rgba(r, g, b, 1.0);
