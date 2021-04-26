class Map
{
    PApplet m_view;  
    TileSet m_tileset;
    int [][]m_map;
    int m_dimX;
    int m_dimY;
    int m_activeTile;
    int m_numTiles;
    boolean m_dirty;
    
    Map(TileSet tileset, int sizeX, int sizeY)
    {
        m_tileset = tileset;
        m_numTiles = m_tileset.getNumTiles();
        m_activeTile = 2;
        m_dimX=sizeX;
        m_dimY=sizeY;
        m_map = new int[m_dimX][m_dimY];
        fillMap(5);
    }
    
    void fillMap(int tile)
    {
        for(int ty = 0; ty < m_dimY; ty++)
        {          
          for(int tx = 0; tx < m_dimX; tx++)
          {    
              setMapTile(tx, ty, tile);
          }
        }        
    }
    
    void nextTile()
    {
        if(m_activeTile < m_numTiles)
        {
            m_activeTile++;         
        }
        else
        {
            m_activeTile = 0;
        }
    }

    void prevTile()
    {
        if(m_activeTile > 0)
        {
            m_activeTile--;        
        }
        else
        {
            m_activeTile = m_numTiles;            
        } 
    }
    
    void setActiveTile(int tile)
    {
        m_activeTile = tile;
    }
    
    int getNumTiles()
    {
        return m_numTiles;  
    }
    
    int getActiveTile()
    {
        return m_activeTile;
    }
    
    int getTileAtCoord(int x, int y)
    {
        return getTileAt(coordToIndex(x), coordToIndex(y));
    }
    
    int getTileAt(int tileX, int tileY)
    {
       if (tileX < m_dimX && tileY < m_dimY)
       {
           return m_map[tileX][tileY];
       }
       
       return -1;
    }
    
    int coordToGrid(int x)
    {
        int tileSize = m_tileset.getTileSize();
        return ((x) / tileSize)*tileSize;   
    }

    int coordToIndex(int x)
    {
        int tileSize = m_tileset.getTileSize();
        return ((x) / tileSize);   
    }    

    int indexToGrid(int x)
    {
        int tileSize = m_tileset.getTileSize();
        return ((x) * tileSize);   
    }  
    
    void selectTileAt(int x, int y)
    {
      int tx = coordToGrid(x);
      int ty = coordToGrid(y);    
      
      m_view.image(m_tileset.getTile(m_activeTile), tx, ty);
      m_view.rect(tx,
           ty,
           TILESIZE,
           TILESIZE);            
    }

    void setTileAt(int x, int y)
    { 
        setMapTile(coordToIndex(x), coordToIndex(y), m_activeTile);      
    }
    
    void setMapTile(int tileX, int tileY, int tileIndex)
    {
       if ((tileX < m_dimX) && (tileY < m_dimY) && (tileX >-1) && (tileY > -1))
       {
           m_dirty = true;
           m_map[tileX][tileY] = tileIndex;
       }      
       else
       { //<>//
           println("Error:setMapTile() - invalid input");  //<>//
       }
    }
    
    void render()
    {
        /**TODO render to double buffer */
        //if(m_dirty == true)
        {
          for(int ty = 0; ty < m_dimY; ty++)
          {          
            for(int tx = 0; tx < m_dimX; tx++)
            {    
                m_view.image(m_tileset.getTile(m_map[tx][ty]), indexToGrid(tx), indexToGrid(ty));
            }
          }
          
          m_dirty = false;
        }             
    }
       
    void setView(PApplet view)
    {
        m_view = view;  
    }
    
    int saveToDisk(String fileName)
    {
        FileIO f = new FileIO(fileName);
        f.saveIntMatrix(m_map);
        return  0;
    }
    
    int loadFromDisk(String fileName)
    {
        FileIO f = new FileIO(fileName);
        m_map = f.loadIntMatrix(m_map);
        return  0;
    }    
  
}
