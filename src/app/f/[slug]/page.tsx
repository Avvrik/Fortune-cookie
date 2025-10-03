import { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { getFortuneBySlug, logEvent } from '@/lib/supabase'
import SharePageClient from './SharePageClient'

interface Props {
  params: { slug: string }
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const fortune = await getFortuneBySlug(params.slug)

  if (!fortune) {
    return {
      title: 'Fortune Not Found',
    }
  }

  const handle = fortune.handle
  const imageUrl = fortune.image_url.startsWith('http') 
    ? fortune.image_url 
    : `${process.env.NEXT_PUBLIC_APP_URL}${fortune.image_url}`

  return {
    title: 'Your Mean Crypto Fortune',
    description: `@${handle} pulled a savage cookie. Want yours?`,
    openGraph: {
      title: 'Your Mean Crypto Fortune',
      description: `@${handle} pulled a savage cookie. Want yours?`,
      images: [
        {
          url: imageUrl,
          width: 1200,
          height: 1200,
          alt: `Fortune cookie for @${handle}`,
        },
      ],
      type: 'website',
    },
    twitter: {
      card: 'summary_large_image',
      site: '@Neon_EVM',
      title: 'Your Mean Crypto Fortune',
      description: `@${handle} pulled a savage cookie. Want yours?`,
      images: [imageUrl],
    },
  }
}

export default async function SharePage({ params }: Props) {
  const fortune = await getFortuneBySlug(params.slug)

  if (!fortune) {
    notFound()
  }

  // Log the view event
  await logEvent({
    type: 'view',
    fortune_slug: params.slug,
    handle: fortune.handle,
  })

  return <SharePageClient fortune={fortune} />
}
