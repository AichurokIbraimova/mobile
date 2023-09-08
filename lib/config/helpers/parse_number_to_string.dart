String parseNumberToString(int number) {
  return switch (number) {
    (1) => 'Первый турист',
    (2) => 'Второй турист',
    (3) => 'Третий турист',
    (4) => 'Четвертый турист',
    (5) => 'Пятый турист',
    (6) => 'Шестой турист',
    (7) => 'Седьмой турист',
    (8) => 'Восьмой турист',
    (9) => 'Девятый турист',
    (10) => 'Десятый турист',
    _ => '$number турист',
  };
}
