-- Migration script to update fortune URLs for production deployment
-- Run this after deploying to production with the correct domain

-- Replace localhost URLs with production domain
UPDATE public.fortunes 
SET share_url = REPLACE(share_url, 'http://localhost:3002', 'https://fortune-cookie-umber.vercel.app')
WHERE share_url LIKE '%localhost%';

UPDATE public.fortunes 
SET share_url = REPLACE(share_url, 'http://localhost:3003', 'https://fortune-cookie-umber.vercel.app')
WHERE share_url LIKE '%localhost%';

-- Verify the update
SELECT id, slug, handle, share_url, created_at 
FROM public.fortunes 
ORDER BY created_at DESC 
LIMIT 10;
