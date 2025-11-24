import 'package:flutter/material.dart';

class TypeOfUserSelectionSection extends StatefulWidget {
  const TypeOfUserSelectionSection({
    super.key,
    required this.options,
    required this.onSelect,
  });
  final List<String> options;
  final Function(List<String> selecteditems) onSelect;
  @override
  State<TypeOfUserSelectionSection> createState() =>
      _TypeOfUserSelectionSectionState();
}

class _TypeOfUserSelectionSectionState
    extends State<TypeOfUserSelectionSection> {
  Set<String> setOfSelected = {};
  @override
  Widget build(BuildContext context) {
    // the extracted varible
    var heightOfGrid = MediaQuery.of(context).size.height * 0.38;
    return Column(
      spacing: 16,
      children: [
        Text(
          "Are you a teacher or a guardian?",
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        // implementing the four blocks of grid
        SizedBox(
          // the var up was extracted as a local varible(actually learnt extracting local varibles here)
          height: heightOfGrid,
          width: heightOfGrid,
          child: GridView.builder(
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              String item = widget.options[index];
              return SelectGridItem(
                // condition for what user selected on the grid
                label: item,
                onSelect: () {
                  if (setOfSelected.contains(item)) {
                    setOfSelected.remove(item);
                  } else {
                    setOfSelected.add(item);
                  }
                  widget.onSelect(setOfSelected.toList());
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class SelectGridItem extends StatefulWidget {
  const SelectGridItem({
    super.key,
    required this.label,
    required this.onSelect,
  });
  final String label;
  final Function() onSelect;

  @override
  State<SelectGridItem> createState() => _SelectGridItemState();
}

class _SelectGridItemState extends State<SelectGridItem> {
  var selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelect();
        setState(() {
          selected = !selected;
        });
      },
      // container for what should display user selects an apotion on the grid
      child: Container(
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(selected ? 255 : 100),
          borderRadius: BorderRadius.circular(42),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
              color: selected ? Theme.of(context).primaryColor : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
