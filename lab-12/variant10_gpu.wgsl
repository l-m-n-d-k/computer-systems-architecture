// Вариант 10: Checker / grid, 3840x2160, cellsX=28, cellsY=18, lineWidth=0.08
// Тело функции для редактора "Код GPU (WGSL)".
// Доступны x, y, uvx, uvy, cx, cy, rgba(), mix1(), mix3() и др.
let cellsX = 28.0;
let cellsY = 18.0;
let lineWidth = 0.08;

// формула (12.6): индексы клетки и локальные координаты внутри клетки
let gx = uvx * cellsX;
let gy = uvy * cellsY;
let ix = i32(floor(gx));
let iy = i32(floor(gy));
let fx = gx - floor(gx);
let fy = gy - floor(gy);

// чётность суммы индексов задаёт цвет клетки
let tile = f32((ix + iy) & 1);

// линия сетки: расстояние до ближайшей стороны клетки меньше половины толщины
let d = min(min(fx, 1.0 - fx), min(fy, 1.0 - fy));
let line = select(0.0, 1.0, d < lineWidth * 0.5);

let light = vec3<f32>(0.93, 0.95, 0.98);
let dark = vec3<f32>(0.15, 0.25, 0.45);
let lineColor = vec3<f32>(0.95, 0.35, 0.10);

let col = mix3(mix3(light, dark, tile), lineColor, line);
return rgba(col.x, col.y, col.z, 1.0);
