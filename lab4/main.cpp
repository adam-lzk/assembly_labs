#include <iostream>

using namespace std;

extern "C" bool l2_1(int a);

extern "C" int l3_1(int n, int* arr);

int main()
{
	int a = 5, b = 3, c = 2, d = 6;
	cout << "a = " << a;
	cout << "\tb = " << b << "\n\n\n";


	a = 1235;
	bool isDiff = l2_1(a);
	if (isDiff) {
		cout << "There are no same digits in this number!\n\n\n";
	}
	else {
		cout << "There are same digits in this number!\n\n\n";
	}

	int n = 9, sum = 0;
	int* mas = new int[n];
	for (int i = 0; i < n; i++) {
		mas[i] = rand() % 100;
		cout << mas[i] << "  ";
	}

	sum = l3_1(n, mas);
	cout << "\nsum = " <<sum;

	return 0;
}
