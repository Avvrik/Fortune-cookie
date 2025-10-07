-- Migration: Update image_catalog with new fortune cookie images
-- Run this in your Supabase SQL Editor

-- Step 1: Insert all 51 new fortune cookie images
INSERT INTO public.image_catalog (id, url, weight, theme, is_active) VALUES
('fortune_1', '/assets/cookies/Fortune Cookie 1.png', 1, 'fortune', true),
('fortune_2', '/assets/cookies/Fortune Cookie 2.png', 1, 'fortune', true),
('fortune_3', '/assets/cookies/Fortune Cookie 3.png', 1, 'fortune', true),
('fortune_4', '/assets/cookies/Fortune Cookie 4.png', 1, 'fortune', true),
('fortune_5', '/assets/cookies/Fortune Cookie 5.png', 1, 'fortune', true),
('fortune_6', '/assets/cookies/Fortune Cookie 6.png', 1, 'fortune', true),
('fortune_7', '/assets/cookies/Fortune Cookie 7.png', 1, 'fortune', true),
('fortune_8', '/assets/cookies/Fortune Cookie 8.png', 1, 'fortune', true),
('fortune_9', '/assets/cookies/Fortune Cookie 9.png', 1, 'fortune', true),
('fortune_10', '/assets/cookies/Fortune Cookie 10.png', 1, 'fortune', true),
('fortune_11', '/assets/cookies/Fortune Cookie 11.png', 1, 'fortune', true),
('fortune_12', '/assets/cookies/Fortune Cookie 12.png', 1, 'fortune', true),
('fortune_13', '/assets/cookies/Fortune Cookie 13.png', 1, 'fortune', true),
('fortune_14', '/assets/cookies/Fortune Cookie 14.png', 1, 'fortune', true),
('fortune_15', '/assets/cookies/Fortune Cookie 15.png', 1, 'fortune', true),
('fortune_16', '/assets/cookies/Fortune Cookie 16.png', 1, 'fortune', true),
('fortune_17', '/assets/cookies/Fortune Cookie 17.png', 1, 'fortune', true),
('fortune_18', '/assets/cookies/Fortune Cookie 18.png', 1, 'fortune', true),
('fortune_19', '/assets/cookies/Fortune Cookie 19.png', 1, 'fortune', true),
('fortune_20', '/assets/cookies/Fortune Cookie 20.png', 1, 'fortune', true),
('fortune_21', '/assets/cookies/Fortune Cookie 21.png', 1, 'fortune', true),
('fortune_22', '/assets/cookies/Fortune Cookie 22.png', 1, 'fortune', true),
('fortune_23', '/assets/cookies/Fortune Cookie 23.png', 1, 'fortune', true),
('fortune_24', '/assets/cookies/Fortune Cookie 24.png', 1, 'fortune', true),
('fortune_25', '/assets/cookies/Fortune Cookie 25.png', 1, 'fortune', true),
('fortune_26', '/assets/cookies/Fortune Cookie 26.png', 1, 'fortune', true),
('fortune_27', '/assets/cookies/Fortune Cookie 27.png', 1, 'fortune', true),
('fortune_28', '/assets/cookies/Fortune Cookie 28.png', 1, 'fortune', true),
('fortune_29', '/assets/cookies/Fortune Cookie 29.png', 1, 'fortune', true),
('fortune_30', '/assets/cookies/Fortune Cookie 30.png', 1, 'fortune', true),
('fortune_31', '/assets/cookies/Fortune Cookie 31.png', 1, 'fortune', true),
('fortune_32', '/assets/cookies/Fortune Cookie 32.png', 1, 'fortune', true),
('fortune_33', '/assets/cookies/Fortune Cookie 33.png', 1, 'fortune', true),
('fortune_34', '/assets/cookies/Fortune Cookie 34.png', 1, 'fortune', true),
('fortune_35', '/assets/cookies/Fortune Cookie 35.png', 1, 'fortune', true),
('fortune_36', '/assets/cookies/Fortune Cookie 36.png', 1, 'fortune', true),
('fortune_37', '/assets/cookies/Fortune Cookie 37.png', 1, 'fortune', true),
('fortune_38', '/assets/cookies/Fortune Cookie 38.png', 1, 'fortune', true),
('fortune_39', '/assets/cookies/Fortune Cookie 39.png', 1, 'fortune', true),
('fortune_40', '/assets/cookies/Fortune Cookie 40.png', 1, 'fortune', true),
('fortune_41', '/assets/cookies/Fortune Cookie 41.png', 1, 'fortune', true),
('fortune_42', '/assets/cookies/Fortune Cookie 42.png', 1, 'fortune', true),
('fortune_43', '/assets/cookies/Fortune Cookie 43.png', 1, 'fortune', true),
('fortune_44', '/assets/cookies/Fortune Cookie 44.png', 1, 'fortune', true),
('fortune_45', '/assets/cookies/Fortune Cookie 45.png', 1, 'fortune', true),
('fortune_46', '/assets/cookies/Fortune Cookie 46.png', 1, 'fortune', true),
('fortune_47', '/assets/cookies/Fortune Cookie 47.png', 1, 'fortune', true),
('fortune_48', '/assets/cookies/Fortune Cookie 48.png', 1, 'fortune', true),
('fortune_49', '/assets/cookies/Fortune Cookie 49.png', 1, 'fortune', true),
('fortune_50', '/assets/cookies/Fortune Cookie 50.png', 1, 'fortune', true),
('fortune_51', '/assets/cookies/Fortune Cookie 51.png', 1, 'fortune', true)
ON CONFLICT (id) 
DO UPDATE SET
  url = EXCLUDED.url,
  weight = EXCLUDED.weight,
  theme = EXCLUDED.theme,
  is_active = EXCLUDED.is_active;

-- Step 2: Update existing fortunes that reference old images
-- Map old images to new ones (distribute across all 51 fortune cookies)
UPDATE public.fortunes
SET 
  image_id = CASE 
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 0 THEN 'fortune_1'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 1 THEN 'fortune_2'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 2 THEN 'fortune_3'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 3 THEN 'fortune_4'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 4 THEN 'fortune_5'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 5 THEN 'fortune_6'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 6 THEN 'fortune_7'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 7 THEN 'fortune_8'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 8 THEN 'fortune_9'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 9 THEN 'fortune_10'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 10 THEN 'fortune_11'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 11 THEN 'fortune_12'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 12 THEN 'fortune_13'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 13 THEN 'fortune_14'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 14 THEN 'fortune_15'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 15 THEN 'fortune_16'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 16 THEN 'fortune_17'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 17 THEN 'fortune_18'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 18 THEN 'fortune_19'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 19 THEN 'fortune_20'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 20 THEN 'fortune_21'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 21 THEN 'fortune_22'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 22 THEN 'fortune_23'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 23 THEN 'fortune_24'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 24 THEN 'fortune_25'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 25 THEN 'fortune_26'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 26 THEN 'fortune_27'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 27 THEN 'fortune_28'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 28 THEN 'fortune_29'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 29 THEN 'fortune_30'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 30 THEN 'fortune_31'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 31 THEN 'fortune_32'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 32 THEN 'fortune_33'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 33 THEN 'fortune_34'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 34 THEN 'fortune_35'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 35 THEN 'fortune_36'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 36 THEN 'fortune_37'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 37 THEN 'fortune_38'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 38 THEN 'fortune_39'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 39 THEN 'fortune_40'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 40 THEN 'fortune_41'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 41 THEN 'fortune_42'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 42 THEN 'fortune_43'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 43 THEN 'fortune_44'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 44 THEN 'fortune_45'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 45 THEN 'fortune_46'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 46 THEN 'fortune_47'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 47 THEN 'fortune_48'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 48 THEN 'fortune_49'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 49 THEN 'fortune_50'
    ELSE 'fortune_51'
  END,
  image_url = CASE 
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 0 THEN '/assets/cookies/Fortune Cookie 1.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 1 THEN '/assets/cookies/Fortune Cookie 2.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 2 THEN '/assets/cookies/Fortune Cookie 3.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 3 THEN '/assets/cookies/Fortune Cookie 4.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 4 THEN '/assets/cookies/Fortune Cookie 5.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 5 THEN '/assets/cookies/Fortune Cookie 6.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 6 THEN '/assets/cookies/Fortune Cookie 7.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 7 THEN '/assets/cookies/Fortune Cookie 8.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 8 THEN '/assets/cookies/Fortune Cookie 9.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 9 THEN '/assets/cookies/Fortune Cookie 10.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 10 THEN '/assets/cookies/Fortune Cookie 11.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 11 THEN '/assets/cookies/Fortune Cookie 12.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 12 THEN '/assets/cookies/Fortune Cookie 13.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 13 THEN '/assets/cookies/Fortune Cookie 14.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 14 THEN '/assets/cookies/Fortune Cookie 15.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 15 THEN '/assets/cookies/Fortune Cookie 16.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 16 THEN '/assets/cookies/Fortune Cookie 17.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 17 THEN '/assets/cookies/Fortune Cookie 18.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 18 THEN '/assets/cookies/Fortune Cookie 19.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 19 THEN '/assets/cookies/Fortune Cookie 20.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 20 THEN '/assets/cookies/Fortune Cookie 21.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 21 THEN '/assets/cookies/Fortune Cookie 22.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 22 THEN '/assets/cookies/Fortune Cookie 23.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 23 THEN '/assets/cookies/Fortune Cookie 24.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 24 THEN '/assets/cookies/Fortune Cookie 25.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 25 THEN '/assets/cookies/Fortune Cookie 26.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 26 THEN '/assets/cookies/Fortune Cookie 27.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 27 THEN '/assets/cookies/Fortune Cookie 28.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 28 THEN '/assets/cookies/Fortune Cookie 29.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 29 THEN '/assets/cookies/Fortune Cookie 30.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 30 THEN '/assets/cookies/Fortune Cookie 31.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 31 THEN '/assets/cookies/Fortune Cookie 32.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 32 THEN '/assets/cookies/Fortune Cookie 33.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 33 THEN '/assets/cookies/Fortune Cookie 34.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 34 THEN '/assets/cookies/Fortune Cookie 35.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 35 THEN '/assets/cookies/Fortune Cookie 36.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 36 THEN '/assets/cookies/Fortune Cookie 37.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 37 THEN '/assets/cookies/Fortune Cookie 38.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 38 THEN '/assets/cookies/Fortune Cookie 39.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 39 THEN '/assets/cookies/Fortune Cookie 40.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 40 THEN '/assets/cookies/Fortune Cookie 41.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 41 THEN '/assets/cookies/Fortune Cookie 42.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 42 THEN '/assets/cookies/Fortune Cookie 43.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 43 THEN '/assets/cookies/Fortune Cookie 44.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 44 THEN '/assets/cookies/Fortune Cookie 45.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 45 THEN '/assets/cookies/Fortune Cookie 46.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 46 THEN '/assets/cookies/Fortune Cookie 47.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 47 THEN '/assets/cookies/Fortune Cookie 48.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 48 THEN '/assets/cookies/Fortune Cookie 49.png'
    WHEN MOD(EXTRACT(EPOCH FROM created_at)::bigint, 51) = 49 THEN '/assets/cookies/Fortune Cookie 50.png'
    ELSE '/assets/cookies/Fortune Cookie 51.png'
  END
WHERE image_id NOT LIKE 'fortune_%';

-- Step 3: Now we can safely delete or deactivate old image entries
-- Option A: Just mark old images as inactive (safer, keeps history)
UPDATE public.image_catalog 
SET is_active = false
WHERE id NOT LIKE 'fortune_%';

-- Option B: Delete old images completely (uncomment if you prefer this)
-- DELETE FROM public.image_catalog 
-- WHERE id NOT LIKE 'fortune_%';

-- Step 4: Verify the update
SELECT 'Image Catalog:' as info;
SELECT * FROM public.image_catalog;

SELECT 'Updated Fortunes Count:' as info;
SELECT COUNT(*) as total_fortunes, image_id, COUNT(*) as count 
FROM public.fortunes 
GROUP BY image_id;

