
class FileIO
{
    void intMatrixToFile(String fileName, int [][] mtx)
    {
        byte [] arr = new byte[mtx.length*mtx[0].length*2];      
        int k = 0;
        for (int i = 0; i < mtx.length; i++)
        {
            for (int j = 0; j < mtx[0].length; j=j+2)
            {
                arr[k++] = byte( 0xff & mtx[i][j]); 
                arr[k++] = byte( mtx[i][j] >> 16);
            }    
        } 
       
      saveBytes(fileName, arr);      
    }   
    
    int[][] loadMatrix(String fileName, int[][] mtx)
    {
        byte [] arr;
        int k = 0;
        
        arr = loadBytes(fileName);        
        println("Loaded len:" + arr.length); 
        println("Matrix"+mtx.length +"x" + mtx[0].length);    
        for (int i = 0; i < mtx.length; i++)
        {
            for (int j = 0; j < mtx[0].length; j++)
            {
                mtx[i][j] = int(arr[k++]);
                mtx[i][j] |= int(arr[k++]<<16);
                print( hex(mtx[i][j])+" ");
            } 
            println("");
        } 
      
        return mtx;
    }
}
