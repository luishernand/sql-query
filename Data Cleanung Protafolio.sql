/*
Cleaning Data in SQL Queries
*/


Select *
From [dbo].[HousingPrice]

-- Standardize Date Format shord dates

Select CONVERT(Date, SaleDate) as SaledateConverted
From [dbo].[HousingPrice]

update [dbo].[HousingPrice]
SET SaleDate = CONVERT(Date, SaleDate)


--if doesn't update properly
ALTER TABLE [dbo].[HousingPrice]
add SaledateConverted DATE;

UPDATE 
	[dbo].[HousingPrice]
SET 
	SaledateConverted = CONVERT(Date, SaleDate)

--Populate Property Addres Data
Select *
From [dbo].[HousingPrice]
where PropertyAddress is  null


Select 
	a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, 
	ISNULL(a.PropertyAddress, b.PropertyAddress) as NewAddres
	
From [dbo].[HousingPrice] a
	JOIN [dbo].[HousingPrice] b
		ON a.ParcelID = b.ParcelID
		and a.[UniqueID ]<> b.[UniqueID ]
where a.PropertyAddress is  null


UPDATE a
	
SET 
	PropertyAddress= ISNULL(a.PropertyAddress, b.PropertyAddress)
From [dbo].[HousingPrice] AS  a
	JOIN [dbo].[HousingPrice] AS b
		ON a.ParcelID = b.ParcelID
		and a.[UniqueID ]<> b.[UniqueID ]
where a.PropertyAddress is  null

select * from [dbo].[HousingPrice]
--where PropertyAddress is  null

-- Breaking out Address into Individual Columns (Address, City, State)
select 
	--PARSENAME(REPLACE(PropertyAddress, ',', '.'),3)
	PARSENAME(REPLACE(PropertyAddress, ',', '.'),2),
	PARSENAME(REPLACE(PropertyAddress, ',', '.'),1)

from 
	[dbo].[HousingPrice]

ALTER TABLE [dbo].[HousingPrice]
add PropertySplitAddress NVARCHAR(255)

ALTER TABLE [dbo].[HousingPrice]
add PropertySplitCity NVARCHAR(255)

UPDATE [dbo].[HousingPrice]
SET PropertySplitAddress = PARSENAME(REPLACE(PropertyAddress, ',', '.'),2)

UPDATE [dbo].[HousingPrice]
SET PropertySplitCity = PARSENAME(REPLACE(PropertyAddress, ',', '.'),1)

Select 
	OwnerAddress 
from [dbo].[HousingPrice]
Where OwnerAddress is not null


select 
	PARSENAME(REPLACE(OwnerAddress, ',', '.'),3),
	PARSENAME(REPLACE(OwnerAddress, ',', '.'),2),
	PARSENAME(REPLACE(OwnerAddress, ',', '.'),1)

from 
	[dbo].[HousingPrice]
ORDER BY OwnerAddress desc

ALTER TABLE [dbo].[HousingPrice]
add OwnerSplitAddress NVARCHAR(255);

UPDATE [dbo].[HousingPrice]
SET OwnerSplitAddress = PARSENAME(REPLACE(PropertyAddress, ',', '.'),3);

ALTER TABLE [dbo].[HousingPrice]
add OwnerSplitCity NVARCHAR(255);

UPDATE [dbo].[HousingPrice]
SET OwnerSplitCity = PARSENAME(REPLACE(PropertyAddress, ',', '.'),2);

ALTER TABLE [dbo].[HousingPrice]
add OwnerSplitSate NVARCHAR(255);

UPDATE [dbo].[HousingPrice]
SET OwnerSplitSate = PARSENAME(REPLACE(PropertyAddress, ',', '.'),3);

-- Change Y and N to Yes and No in "Sold as Vacant" field
select 
		Distinct(SoldAsVacant), 
		COUNT(SoldAsVacant)
from [dbo].[HousingPrice]
group by SoldAsVacant


select SoldAsVacant,
	CASE when SoldAsVacant = 'Y' then 'Yes'
	when SoldAsVacant = 'N' then 'No'
	ELSE SoldAsVacant
	end

		
from [dbo].[HousingPrice]


UPDATE [dbo].[HousingPrice]
SET SoldAsVacant = CASE when SoldAsVacant = 'Y' then 'Yes'
	when SoldAsVacant = 'N' then 'No'
	ELSE SoldAsVacant
	end

--Remove duplicate 
WITH RownNumCTE AS (
	select *,
	ROW_NUMBER() OVER(
		PARTITION BY ParcelID, 
					[PropertyAddress],
					[SalePrice],
					[SaleDate],
					[LegalReference]
				Order By 
					[UniqueID ]
	)row_num		
	from [dbo].[HousingPrice]
)

--DETELE
Select *
from RownNumCTE
where row_num > 1
	--ParcelID = '081 02 0 144.00'

-- Delete Unused Columns
select * from [dbo].[HousingPrice]

ALTER TABLE [dbo].[HousingPrice]
DROP COLUMN 
	[OwnerAddress], 
	[TaxDistrict],
	[PropertyAddress],
	[SaleDate]