#include <iostream>
using namespace std;
// function Add adds
int Add(int x, int y)
{
	cout << "In Add(), recieved " << x << " and " << y << "\n";
	return(x+y);
}

int main() {
	cout << "Here is 5: " << 5 << "\n";
	cout << "The manipulator endl writes a new line to the screen." << endl;
	
	cout << "Here is the sum of 8 and 5:\t" << 8+5 << endl;
	cout << "Here's a fraction:\t\t" << (float) 5/8 << endl;
	cout << "And a very very big number:\t" << (double) 7000*7000 << endl;

	cout << "Austin Soplata is a C++ programmer!\n";
	// Comments should explain the WHY of a code section, not how/what.
	cout << "The size of an int is:\t\t"	<< sizeof(int)	<< " bytes.\n";
	cout << "The size of a short int is:\t" << sizeof(short) << " bytes.\n";
	cout << "The size of a long int is:\t" << sizeof(long) << " bytes.\n";
	cout << "The size of a char is:\t\t"	<< sizeof(char)	<< " bytes.\n";
	cout << "The size of a float is:\t\t"	<< sizeof(float) << " bytes.\n";
	cout << "The size of a double is:\t"	<< sizeof(double) << " bytes.\n";
	// Begin function callin
/*	int a, b, c;
	cout << "Enter two numbers : ";
	cin >> a;
	cin >> b;
	cout << "\nCalling Add()\n";
	c=Add(a,b);
	cout << "\nBack in main().\n";
	cout << "c was set to " << c;
 */

// Defining the the typedef
typedef unsigned short int USHORT;
USHORT nodeX = 5, nodeY = 7;
USHORT nodeArea = nodeX * nodeY;
	cout << "Width: " << nodeX << endl;
	cout << "Height: " << nodeY << endl;
	cout << "Area: " << nodeArea << endl;
	cout << "\nExiting...\n";
return 0;
}





