public class demo0623 {

    public static void main(String[] args) {
        int input[]={1,3,7,9,3,3,5,6,7,3};
        System.out.println(new demo0623().test(input, 7));
    }

    public int test(int input[], int intVal){
        int finalLength= input.length;
        for (int i=0; i< finalLength; i++){
            System.out.print(input[i]+" ");
        }
        System.out.println("");
        int j=0;
        for (int i=0; i< input.length; i++){
            if (input[i] == intVal){
                finalLength --;
            } else{
                input[j]=input[i];
                j++;
            }
        }
        for (int i=0; i< finalLength; i++){
            System.out.print(input[i]+" ");
        }
        System.out.println("\nfinalLength: "+finalLength);
        return finalLength;
    }
}
