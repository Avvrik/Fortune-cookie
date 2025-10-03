# Mean Crypto Fortune Cookie

A Next.js web app that generates mean crypto fortune cookies for X/Twitter users. Enter a handle and get roasted by randomly selected fortune cookie images.

## Features

- 🍪 Random fortune cookie generation with pre-made images
- 🐦 Twitter/X sharing with custom OpenGraph cards
- 📊 Basic analytics tracking
- 🎨 Beautiful gradient UI with TailwindCSS
- ⚡ Fast performance with Next.js 14 App Router
- 🔒 Secure with Supabase Row Level Security

## Tech Stack

- **Frontend**: Next.js 14 (App Router) + React + TailwindCSS
- **Runtime**: Vercel (Edge for static/SSR; Node serverless for API)
- **Database**: Supabase (Postgres)
- **Asset hosting**: /public/assets (Vercel)
- **Deploy**: Vercel

## Setup

### 1. Clone and Install

```bash
git clone <your-repo>
cd Fortune-cookie
npm install
```

### 2. Set up Supabase

1. Create a new Supabase project at [supabase.com](https://supabase.com)
2. Go to SQL Editor and run the contents of `supabase-schema.sql`
3. Get your project URL and anon key from Settings > API

### 3. Environment Variables

Create a `.env.local` file:

```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
NEXT_PUBLIC_APP_URL=http://localhost:3000
```

### 4. Run Development Server

```bash
npm run dev
```

Visit [http://localhost:3000](http://localhost:3000) to see the app.

## Deployment

### Deploy to Vercel

1. Push your code to GitHub
2. Connect your repo to [Vercel](https://vercel.com)
3. Add environment variables in Vercel dashboard
4. Update `NEXT_PUBLIC_APP_URL` to your production domain

## Usage

1. Enter a Twitter/X handle (without @)
2. Click "Tell me" to generate a fortune
3. Share the result on X with the custom OpenGraph card
4. The shared link shows the selected fortune cookie image

## API Endpoints

- `POST /api/fortune` - Generate a new fortune
- `GET /api/variants` - Get available image variants
- `GET /f/[slug]` - View/share a specific fortune

## Database Schema

- `image_catalog` - Pre-made fortune cookie images
- `fortunes` - Generated fortune records
- `events` - Analytics events (generate, view, share_click)

## Customization

### Adding New Fortune Images

1. Add SVG/PNG files to `public/assets/cookies/`
2. Insert new records into `image_catalog` table:

```sql
INSERT INTO public.image_catalog (id, url, weight, theme) VALUES
('your_image_id', '/assets/cookies/your_image.svg', 1, 'your_theme');
```

### Customizing Fortune Text

Edit the SVG files in `public/assets/cookies/` to change the fortune messages.

## License

MIT License - see LICENSE file for details.