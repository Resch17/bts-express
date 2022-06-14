SELECT p.[Id], p.[Name], p.[UserId], p.[PatternId], p.[PatternSizeId], 
							p.[IsComplete], p.[ProjectStatusId], 
							pstatus.[Name] AS ProjectStatus,
							p.[CreateDateTime],
							pat.[Name] AS [PatternName],
							n.[Id] AS NoteId, n.[Text] AS NoteText,
							patsize.[Yards], s.[Name] AS SizeName, s.[Abbreviation],
							patimg.[Id] AS PatternImageId, patimg.[IsCover], patimg.[Url] AS PatternImageUrl,
							f.[Id] AS FabricId, f.[Name] AS FabricName, ft.[Name] AS FabricTypeName, f.[PricePerYard],
							f.[YardsInStock], r.[Name] AS RetailerName,
							fi.[Url] AS FabricImageUrl, fi.[FabricId] AS ImageFabricId
						FROM Project p
							LEFT JOIN Pattern pat ON pat.Id = p.PatternId
							LEFT JOIN ProjectStatus pstatus ON p.ProjectStatusId = pstatus.Id
							LEFT JOIN PatternImage patimg ON pat.Id = patimg.PatternId
							LEFT JOIN ProjectNotes n ON n.ProjectId = p.Id
							LEFT JOIN PatternSize patsize ON patsize.Id = p.PatternSizeId
							LEFT JOIN Size s ON s.Id = patsize.SizeId
							LEFT JOIN ProjectFabric pf ON pf.ProjectId = p.Id
							LEFT JOIN Fabric f ON f.Id = pf.FabricId
							LEFT JOIN FabricType ft ON ft.Id = f.FabricTypeId
							LEFT JOIN Retailer r ON r.Id = f.RetailerId
							LEFT JOIN FabricImage fi ON fi.FabricId = f.Id
						WHERE p.UserId = 2