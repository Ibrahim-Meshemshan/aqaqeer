final List<String> days = List.generate(31, (index) => (index + 1).toString());

final List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];
final List<String> monthsAsNumber = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
];

final List<String> years =
List.generate(101, (index) => (DateTime.now().year - index).toString());

final List<String> hours = List.generate(12, (index) => (index + 1).toString());

final List<String> minutes = List.generate(60, (index) {
  if (index < 10) {
    return '0$index';
  } else {
    return index.toString();
  }
});

final List<String> periods = ['ص', 'م'];
