

class TileStack
{
    final int stackSize = 16;
    PApplet m_view;  
    TileSet m_tileset;
    int [] m_stack;
    int m_tilesize;
    int m_numTiles;
    int m_posx;
    int m_posy;
    
    TileStack(TileSet tileset, int posx, int posy, PApplet view)
    {
        m_tileset = tileset;
        m_tilesize = m_tileset.getTileSize();
        m_numTiles = m_tileset.getNumTiles();
        m_stack = new int[stackSize];
        m_posx = posx;
        m_posy = posy;    
        m_view = view;
    }  
    
    int incTile(int tile)
    {
        tile++; 
        if(tile >= m_numTiles)
        {
            tile = 0; 
        }
        
        return tile;
    }
    
    void update(int activeTile)
    {
        int tile = activeTile-stackSize/2;
        
        if (tile<0)
        {
            tile = m_numTiles+tile; 
        }
        
        for(int x = 0; x < stackSize; x++)
        {
          //println(x, activeTile);
          m_view.image(m_tileset.getTile(tile), m_posx+m_tilesize*x, m_posy,m_tilesize,m_tilesize);
          tile = incTile(tile);          
        }
        
        strokeWeight(4);
        int x = stackSize/2;
        m_view.rect(m_posx+m_tilesize*x, m_posy, m_tilesize, m_tilesize);   
               
    }
  
}
