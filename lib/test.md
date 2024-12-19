return Scaffold(
backgroundColor: AppColor.mPrimary,
body: SingleChildScrollView(
child: Column(
children: [
Container(
height: 120, // Set your desired height
color: AppColor.rBackground, // Background color of the AppBar
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Row(
children: [
SizedBox(
width: 20,
),
Image.asset('assets/photos/homepage_logo.png'),
],
),
Row(
children: [
Icon(
Icons.menu,
color: AppColor.mPrimary,
),
SizedBox(
width: 20,
),
],
),
],
),
),
SizedBox(height: 16),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
'ကျမ်းမာတိကာများ',
style: TextStyle(
color: AppColor.rBackground,
fontSize: 18,
fontWeight: FontWeight.w700,
),
),
],
),
// First GridView
Container(
height: 500, // Set a fixed height for the GridView
child: GridView.builder(
physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 5, // 5 columns
childAspectRatio: 1, // Aspect ratio of grid items
),
itemCount: 40, // 40 items for 8 rows
itemBuilder: (context, index) {
return Container(
margin: EdgeInsets.all(4.0),
color: Colors.blue[(index % 9 + 1) * 100], // Color variation
child: Center(
child: Text(
'Item ${index + 1}',
style: TextStyle(color: Colors.white),
),
),
);
},
),
),
// Second GridView
Container(
height: 500, // Set a fixed height for the GridView
child: GridView.builder(
physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 5, // 5 columns
childAspectRatio: 1, // Aspect ratio of grid items
),
itemCount: 40, // 40 items for 8 rows
itemBuilder: (context, index) {
return Container(
margin: EdgeInsets.all(4.0),
color: Colors.blue[(index % 9 + 1) * 100], // Color variation
child: Center(
child: Text(
'Item ${index + 1}',
style: TextStyle(color: Colors.white),
),
),
);
},
),
),
],
),
),
);
