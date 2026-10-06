public class Matriz {

    public static void main(String[] args) {

        int[][] MTZ = {
                {47, 83, 16, 92},
                {35, 61, 28, 74},
                {109, 53, 81, 22},
                {67, 14, 39, 126}
        };

        // 1. Buscar un número X en la matriz
        int x = 53;
        boolean encontrado = false;

        for (int i = 0; i < MTZ.length; i++) {
            for (int j = 0; j < MTZ.length; j++) {

                if (MTZ[i][j] == x) {
                    System.out.println("El número " + x
                            + " está en la fila " + (i + 1)
                            + " y columna " + (j + 1));

                    encontrado = true;
                }
            }
        }

        if (!encontrado) {
            System.out.println("El número " + x + " no está en la matriz");
        }


        // 2. Encontrar el número mayor y su posición
        int mayor = MTZ[0][0];
        int fila = 0;
        int columna = 0;

        for (int i = 0; i < MTZ.length; i++) {
            for (int j = 0; j < MTZ.length; j++) {

                if (MTZ[i][j] > mayor) {
                    mayor = MTZ[i][j];
                    fila = i;
                    columna = j;
                }
            }
        }

        System.out.println("El número mayor es: " + mayor);
        System.out.println("Está en la fila: " + (fila + 1));
        System.out.println("Está en la columna: " + (columna + 1));


        // 3. Llenar las dos diagonales con ceros
        int n = MTZ.length;

        for (int i = 0; i < n; i++) {

            // Diagonal principal
            MTZ[i][i] = 0;

            // Diagonal secundaria
            MTZ[i][n - 1 - i] = 0;
        }


        // Mostrar la matriz después de modificar las diagonales
        System.out.println("Matriz con las diagonales en cero:");

        for (int i = 0; i < MTZ.length; i++) {
            for (int j = 0; j < MTZ.length; j++) {
                System.out.print(MTZ[i][j] + "\t");
            }
            System.out.println();
        }
    }
}