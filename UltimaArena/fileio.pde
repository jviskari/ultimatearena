
class FileIO
{
     String m_fileName;
     
     FileIO(String fileName)
     {
         m_fileName = new String(fileName);  
     }
              
    void saveIntMatrix(int [][] mtx)
    {
        byte [] arr = new byte[mtx.length*mtx[0].length*4];      
        int k = 0;
        for (int i = 0; i < mtx.length; i++)
        {
            for (int j = 0; j < mtx[0].length; j++)
            {
                int in = mtx[j][i];
                print(hex(byte(in),2)+" ");
                arr[k++] = byte(in>>0  & 0xff);
                arr[k++] = byte(in>>8  & 0xff);
                arr[k++] = byte(in>>16 & 0xff);
                arr[k++] = byte(in>>24 & 0xff);                
            }    
            
            println("");
        } 
       
        saveBytes(m_fileName, arr);      
    }   
    
    int[][] loadIntMatrix(int[][] mtx)
    {
        byte [] arr;
        int k = 0;
        
        arr = loadBytes(m_fileName);        
        println("Loaded len:" + arr.length); 
        println("Matrix"+mtx.length +"x" + mtx[0].length);    
        for (int i = 0; i < mtx.length; i++)
        {
            for (int j = 0; j < mtx[0].length; j++)
            {
                int temp = arr[k] | arr[k+1] << 8 | arr[k+2] << 16  |arr[k+3] <<24;
                k+=4;
                mtx[j][i] = temp;
                print(hex(byte(temp),2)+" ");
                
            } 
            println("");
        } 
      
        return mtx;
    }
}
