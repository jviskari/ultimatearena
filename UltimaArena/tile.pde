class TileSet
{
    PImage [] m_tiles;
    int m_tileCount;
    int m_tilesize;
    
    TileSet(String filename, int tilesX, int tilesY, int tileSize)
    {
        PImage bitmap = new PImage();
        bitmap = loadImage(filename);
        m_tilesize = tileSize;
        m_tileCount = 0;
        m_tiles = new PImage[tilesX*tilesY];
 
        for( int j = 0; j < tilesY; j++)
        { 
          for(int i = 0; i < tilesX; i++)
          {       
              m_tiles[m_tileCount++] = bitmap.get(m_tilesize*i, m_tilesize*j, m_tilesize, m_tilesize);             
          }
        }          
    } 
    
    PImage getTile(int index)
    {
        PImage retval;
        if (index <  m_tileCount)
        {
            retval = m_tiles[index];
        }
        else
        {
            retval = m_tiles[0];
        }      
        return retval;
    }
    
    int getTileSize()
    {
        return m_tilesize; 
    }
    
    int getNumTiles()
    {
        return m_tileCount; 
    }    
    
}
