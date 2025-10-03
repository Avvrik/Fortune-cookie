import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY!

export const supabase = createClient(supabaseUrl, supabaseKey)

// Types for our database tables
export interface ImageCatalog {
  id: string
  url: string
  weight: number
  is_active: boolean
  theme?: string
}

export interface Fortune {
  id: string
  slug: string
  handle: string
  image_id: string
  image_url: string
  created_at: string
  ip_hash?: string
  user_agent?: string
  share_url: string
}

export interface Event {
  id: number
  type: string
  fortune_slug: string
  handle?: string
  created_at: string
}

// Database queries
export const getRandomImage = async (): Promise<ImageCatalog | null> => {
  const { data, error } = await supabase
    .from('image_catalog')
    .select('*')
    .eq('is_active', true)
    .order('weight', { ascending: false })

  if (error || !data || data.length === 0) {
    return null
  }

  // Simple weighted random selection
  const totalWeight = data.reduce((sum, img) => sum + img.weight, 0)
  let random = Math.random() * totalWeight

  for (const image of data) {
    random -= image.weight
    if (random <= 0) {
      return image
    }
  }

  return data[0] // fallback
}

export const createFortune = async (fortune: Omit<Fortune, 'id' | 'created_at'>) => {
  const { data, error } = await supabase
    .from('fortunes')
    .insert(fortune)
    .select()
    .single()

  if (error) throw error
  return data
}

export const getFortuneBySlug = async (slug: string): Promise<Fortune | null> => {
  const { data, error } = await supabase
    .from('fortunes')
    .select('*')
    .eq('slug', slug)
    .single()

  if (error) return null
  return data
}

export const logEvent = async (event: Omit<Event, 'id' | 'created_at'>) => {
  const { error } = await supabase
    .from('events')
    .insert(event)

  if (error) {
    console.error('Failed to log event:', error)
  }
}
