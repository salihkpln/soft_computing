#include <stdio.h>

// dy/dx = x + y icin cozum saglar. Farkli denklemler icin f fonksiyonunun govdesi degistirilmelidir. 
// Gerekirse math kutuphanesi de include edilebilir.
double f(double x, double y) {
	return x + y;
}

// x0 -> baslangic x degeri
// y0 -> baslangic y degeri
// x_end -> bitis x degeri 
// dx -> adim sayisi
void rk4(double x0, double y0, double x_end, double dx) {
	double k1, k2, k3, k4;
	int step_count = (int)((x_end - x0) / dx);
	printf("x\ty\n");

	for (int i = 0; i < step_count; i++) {
		k1 = dx * f(x0, y0);
		k2 = dx * f(x0 + (dx / 2.0), y0 + (k1 / 2.0));
		k3 = dx * f(x0 + (dx / 2.0), y0 + (k2 / 2.0));
		k4 = dx * f(x0 + dx, y0 + k3);
		
		y0 = y0 + (k1 + k2 * 2 + k3 * 2 + k4) / 6.0;
		x0 = x0 + dx;
		
		printf("%.4lf\t%.4lf\n", x0, y0);
	}
}

int main() {
    // ornek degerler
	double x0 = 0.0;
	double y0 = 1.0;
	double x_end = 1.0;
	double dx = 0.2;

	rk4(x0, y0, x_end, dx);
	return 0;
}