FOR EACH ITEM
      FIELDS (ItemNum ItemName Price CatPage)
      NO-LOCK
      WHERE item.ItemName BEGINS "a":
      DISPLAY item.ItemNum 
                   item.ItemName 
                   item.Price
                   ITEM.CatPage.
      END.
