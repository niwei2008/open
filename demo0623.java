public class demo0623 {

    public static void main(String[] args) {
        int input[]={1,3,7,9,3,3,5,6,7,3};
        int input2[]={3,33,7,9,3,3,5,6,7,3};

        test(input, 3);
        test(input2, 3);
        test(input, 7);
    }

    public static int test(int input[], int intVal){
        int finalLength= input.length;
        for (int i=0; i< finalLength; i++){
            System.out.print(input[i]+" ");
        }
        System.out.println("\nafter remove "+intVal+":");
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
        System.out.println("\nfinalLength: "+finalLength +"\n");
        return finalLength;
    }
}
