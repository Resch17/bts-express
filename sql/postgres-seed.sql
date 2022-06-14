INSERT INTO "user"
    (UserName, FirebaseUserId, Email, RegisterDateTime, IsAdministrator)
VALUES
    ('Admin', 'i79KRygrWgRR9nZGeRd3JxGBSnc2', 'aaronmresch@gmail.com', current_timestamp, true);
INSERT INTO "user"
    (UserName, FirebaseUserId, Email, RegisterDateTime, IsAdministrator)
VALUES
    ('TestUser54481', 'ClRVNgCR0AVYEw9F5bozqnrcUDk2', 'test@example.com', current_timestamp, false);
INSERT INTO "user"
    (UserName, FirebaseUserId, Email, RegisterDateTime, IsAdministrator)
VALUES
    ('Amanda', 'lTqJr1eqYOh0vJdVrncc0D2XXaW2', 'amandaeresch@gmail.com', current_timestamp, true);

INSERT INTO Category
    (Name)
VALUES
    ('Dresses');
INSERT INTO Category
    (Name)
VALUES
    ('Pajamas');
INSERT INTO Category
    (Name)
VALUES
    ('Swimwear');
INSERT INTO Category
    (Name)
VALUES
    ('Pets');
INSERT INTO Category
    (Name)
VALUES
    ('Lingerie');
INSERT INTO Category
    (Name)
VALUES
    ('Accessories');
INSERT INTO Category
    (Name)
VALUES
    ('Men''s Tops');
INSERT INTO Category
    (Name)
VALUES
    ('Men''s Bottoms');
INSERT INTO Category
    (Name)
VALUES
    ('Women''s Tops');
INSERT INTO Category
    (Name)
VALUES
    ('Women''s Bottoms');
INSERT INTO Category
    (Name)
VALUES
    ('Kid''s');
INSERT INTO Category
    (Name)
VALUES
    ('Baby');
INSERT INTO Category
    (Name)
VALUES
    ('Other');

INSERT INTO ProjectStatus
    (Name)
VALUES
    ('Not Started');
INSERT INTO ProjectStatus
    (Name)
VALUES
    ('Fabric Ordered');
INSERT INTO ProjectStatus
    (Name)
VALUES
    ('Fabric Cut');
INSERT INTO ProjectStatus
    (Name)
VALUES
    ('Sewing Started');
INSERT INTO ProjectStatus
    (Name)
VALUES
    ('Complete');

INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('00', '00');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('0', '0');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('2', '2');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('4', '4');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('6', '6');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('8', '8');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('10', '10');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('12', '12');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('14', '14');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('16', '16');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('18', '18');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('20', '20');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('XS', 'XS');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('S', 'S');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('M', 'M');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('L', 'L');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('XL', 'XL');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('2X', '2X');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('3X', '3X');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('4X', '4X');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('12-18', '12-18');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('18-24', '18-24');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('2T', '2T');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('3T', '3T');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('5', '5');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('7', '7');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('Newborn', 'N');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('3-6', '3-6');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('6-12', '6-12');
INSERT INTO Size
    (Name, Abbreviation)
VALUES
    ('Other', 'N/A');

INSERT INTO Publisher
    (Name, Url)
VALUES
    ('Ellie & Mac', 'https://www.ellieandmac.com/');
INSERT INTO Publisher
    (Name, Url)
VALUES
    ('True Bias', 'https://shop.truebias.com/');
INSERT INTO Publisher
    (Name, Url)
VALUES
    ('Closet Core', 'https://www.closetcorepatterns.com/');
INSERT INTO Publisher
    (Name, Url)
VALUES
    ('Peek-a-Boo', 'https://www.peekaboopatternshop.com/');
INSERT INTO Publisher
    (Name, Url)
VALUES
    ('Rad Patterns', 'https://www.radpatterns.com/');
INSERT INTO Publisher
    (Name, Url)
VALUES
    ('Seamwork', 'https://www.seamwork.com/');
INSERT INTO Publisher
    (Name)
VALUES
    ('Other');
INSERT INTO Publisher
    (Name, Url)
VALUES
    ('Megan Nielsen Patterns', 'https://megannielsen.com/');
INSERT INTO Publisher
    (Name, Url)
VALUES
    ('Love Notions', 'https://www.lovenotions.com/');
INSERT INTO Publisher
    (Name, Url)
VALUES
    ('Lowland Kids', 'https://www.lowlandkids.com/');
INSERT INTO Publisher
    (Name, Url)
VALUES
    ('Sew a Little Seam', 'https://www.sewalittleseam.com/');
INSERT INTO Publisher
    (Name, Url)
VALUES
    ('Greenstyle Creations', 'https://greenstylecreations.com/');

INSERT INTO Retailer
    (Name, Url)
VALUES
    ('KnitFabric.com', 'https://knitfabric.com/');
INSERT INTO Retailer
    (Name, Url)
VALUES
    ('Raspberry Creek', 'https://raspberrycreekfabrics.com/');
INSERT INTO Retailer
    (Name, Url)
VALUES
    ('Mily Mae Fabrics', 'https://milymaefabricshop.com/');
INSERT INTO Retailer
    (Name, Url)
VALUES
    ('Threadbear Textile Co', 'https://threadbeartextileco.com/');
INSERT INTO Retailer
    (Name, Url)
VALUES
    ('Joann', 'https://www.joann.com/');
INSERT INTO Retailer
    (Name)
VALUES
    ('Other');
INSERT INTO Retailer
    (Name, Url)
VALUES
    ('So Sew English Fabrics', 'https://www.sosewenglishfabrics.com/');
INSERT INTO Retailer
    (Name, Url)
VALUES
    ('Olga''s Closet', 'https://www.olgascloset.com/');

INSERT INTO FabricType
    (Name)
VALUES
    ('Knit');
INSERT INTO FabricType
    (Name)
VALUES
    ('Woven');
INSERT INTO FabricType
    (Name)
VALUES
    ('Other');

INSERT INTO Pattern
    (Url, UserId, Name, PublisherId, PurchaseDate, FabricTypeId, Notes, CategoryId)
VALUES
    ('https://www.seamwork.com/catalog/gabrielle', 2, 'Gabrielle Skater Dress', 6, current_timestamp, 1, 'This pattern runs a little small... all work and no play makes Marty a dull girl all work and no play makes Marty a dull girl all work and no play makes Marty a dull girl all work and no play makes Marty a dull girl all work and no play makes Marty a dull girl', 1);
INSERT INTO Pattern
    (Url, UserId, Name, PublisherId, PurchaseDate, FabricTypeId, Notes, CategoryId)
VALUES
    ('https://shop.truebias.com/product/hudson-pant', 2, 'Hudson Pant', 2, current_timestamp, 1, 'This pattern runs a little small... all work and no play makes Marty a dull girl all work and no play makes Marty a dull girl all work and no play makes Marty a dull girl all work and no play makes Marty a dull girl all work and no play makes Marty a dull girl', 10);

INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (1, 13, 2.5);
INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (1, 14, 2.5);
INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (1, 15, 2.625);
INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (1, 16, 2.625);
INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (1, 17, 2.75);
INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (1, 18, 4.125);
INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (1, 19, 4.25);
INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (2, 2, 1.5);
INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (2, 3, 1.5);
INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (2, 4, 1.5);
INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (2, 5, 1.5);
INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (2, 6, 1.5);
INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (2, 7, 1.75);
INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (2, 8, 1.75);
INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (2, 9, 1.75);
INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (2, 10, 2);
INSERT INTO PatternSize
    (PatternId, SizeId, Yards)
VALUES
    (2, 11, 2);

INSERT INTO Fabric
    (RetailerId, UserId, Name, Url, PricePerYard, YardsInStock, FabricTypeId, Notes)
VALUES
    (1, 2, 'Washed Pink Dye UV 50+ Nylon Spandex', 'https://knitfabric.com/washed-pink-dye-uv-50-nylon-spandex/', 16, 5.5, 1, 'This fabric is kinda ugly tbh');
INSERT INTO Fabric
    (RetailerId, UserId, Name, Url, PricePerYard, YardsInStock, FabricTypeId, Notes)
VALUES
    (2, 2, 'Vertical Rainbow Brushed Poly', 'https://milymaefabricshop.com/collections/brushed-poly/products/vertical-rainbow', 8.50, 3, 1, 'This fabric is kinda amazing tbh');

INSERT INTO Project
    (Name, UserId, PatternId, ProjectStatusId, PatternSizeId, CreateDateTime, iscomplete)
VALUES
    ('Tie-dye Pants for Amanda', 2, 2, 3, 10, current_timestamp, false);
INSERT INTO Project
    (Name, UserId, PatternId, ProjectStatusId, PatternSizeId, CreateDateTime, iscomplete)
VALUES
    ('Awesome Dress', 2, 1, 2, 2, current_timestamp, false);

INSERT INTO ProjectFabric
    (ProjectId, FabricId, Yards)
VALUES
    (1, 1, 1.5);
INSERT INTO ProjectFabric
    (ProjectId, FabricId, Yards)
VALUES
    (2, 2, 2.5);

INSERT INTO ProjectNotes
    (ProjectId, Text)
VALUES
    (1, 'See if Amanda really wants these to be pink');
INSERT INTO ProjectNotes
    (ProjectId, Text)
VALUES
    (2, 'Seriously, this dress needs to happen');

INSERT INTO PatternImage
    (PatternId, Url, IsCover)
VALUES
    (1, 'https://www.seamwork.com/media/products/catalog/3060/3060-185e9c4e.jpg', true);
INSERT INTO PatternImage
    (PatternId, Url, IsCover)
VALUES
    (1, 'https://www.seamwork.com/media/products/catalog/3060/3060-77198d26.jpg', false);
INSERT INTO PatternImage
    (PatternId, Url, IsCover)
VALUES
    (1, 'https://www.seamwork.com/media/products/catalog/3060/3060-50eb4d92.jpg', false);
INSERT INTO PatternImage
    (PatternId, Url, IsCover)
VALUES
    (2, 'https://assets.bigcartel.com/product_images/202839518/Hudson+pant+hero-1354.jpg', true);

INSERT INTO FabricImage
    (FabricId, Url)
VALUES
    (1, 'https://cdn11.bigcommerce.com/s-daswymv3tx/images/stencil/960w/products/10993/10870/BTP1129C1__06531__87656.1615479451.jpg');
INSERT INTO FabricImage
    (FabricId, Url)
VALUES
    (2, 'https://cdn.shopify.com/s/files/1/2281/1887/products/image_837d2ccd-fecf-4066-912e-ea2ba00e6d5f_720x.png');

INSERT INTO "file"
    (Name, Path, PatternId)
VALUES
    ('Instructions', 'https://drive.google.com/file/d/1TXZtqm37JcVOxUHNknKURxf8R16qFqF4/view?usp=sharing', 1)
