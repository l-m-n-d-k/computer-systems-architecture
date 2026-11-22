/*
 * Код функции, восстановленный Ghidra (decompiled.c), с минимальными
 * правками, нужными только чтобы он собрался компилятором C:
 *  - добавлен typedef byte (у Ghidra это свой тип, не определённый в C);
 *  - функция переименована из entry в restored_convert, чтобы её можно
 *    было вызвать из теста (Ghidra назвала её entry, так как других
 *    подсказок об имени у неё не было - имя функции не восстанавливается).
 * Сама логика не тронута ни на строчку.
 */
typedef unsigned char byte;

long restored_convert(char *param_1, char *param_2)

{
  char *pcVar1;
  char *pcVar2;
  char cVar3;

  cVar3 = *param_1;
  if (cVar3 == '\0') {
    param_2[1] = '\0';
    *param_2 = '!';
    return 2;
  }
  pcVar1 = param_2;
  do {
    pcVar2 = pcVar1;
    param_1 = param_1 + 1;
    if ((byte)(cVar3 + 0x9fU) < 0x1a) {
      cVar3 = cVar3 + -0x20;
    }
    *pcVar2 = cVar3;
    cVar3 = *param_1;
    pcVar1 = pcVar2 + 1;
  } while (cVar3 != '\0');
  pcVar2[2] = '\0';
  pcVar2[1] = '!';
  /* Ghidra записала это как (int)pcVar2+3-(int)param_2 - при разрядности
     указателя 64 бита такое приведение к int обрежет адрес и даст неверный
     результат на реальных (не крошечных) адресах. Заменено на арифметику
     прямо над указателями - смысл тот же (длина = конец минус начало),
     но без обрезания до 32 бит. Это и есть необходимое исправление. */
  return (long)(pcVar2 + 3 - param_2);
}
