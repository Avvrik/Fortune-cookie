'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { Fortune } from '@/lib/supabase'

interface Props {
  fortune: Fortune
}

export default function SharePageClient({ fortune }: Props) {
  const [copied, setCopied] = useState(false)
  const router = useRouter()

  const handleShare = () => {
    const tweetText = `got fortune slapped by @Neon_EVM`
    const shareUrl = encodeURIComponent(fortune.share_url)
    const text = encodeURIComponent(tweetText)
    
    window.open(
      `https://twitter.com/intent/tweet?text=${text}&url=${shareUrl}&via=Neon_EVM`,
      '_blank'
    )
  }

  const handleCopyLink = async () => {
    try {
      await navigator.clipboard.writeText(fortune.share_url)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch (err) {
      console.error('Failed to copy link:', err)
    }
  }

  const imageUrl = fortune.image_url.startsWith('http') 
    ? fortune.image_url 
    : `${process.env.NEXT_PUBLIC_APP_URL}${fortune.image_url}`

  return (
    <main className="min-h-screen bg-gradient-to-br from-purple-900 via-blue-900 to-indigo-900 flex items-center justify-center p-4">
      <div className="max-w-lg w-full">
        {/* Header */}
        <div className="text-center mb-8">
          <h1 className="text-3xl font-bold text-white mb-2">
            @{fortune.handle}'s Fortune
          </h1>
          <p className="text-gray-300">
            Check out this savage crypto fortune!
          </p>
        </div>

        {/* Fortune Display */}
        <div className="bg-white/10 backdrop-blur-sm rounded-xl p-6 shadow-xl">
          <div className="text-center space-y-6">
            <img
              src={imageUrl}
              alt={`Fortune cookie for @${fortune.handle}`}
              className="w-48 h-48 mx-auto rounded-lg shadow-lg object-cover"
            />
            
            <div>
              <p className="text-white text-lg">
                @{fortune.handle} got fortune slapped!
              </p>
              <p className="text-gray-300 text-sm mt-2">
                Generated on {new Date(fortune.created_at).toLocaleDateString()}
              </p>
            </div>

            {/* Action Buttons */}
            <div className="space-y-3">
              <button
                onClick={handleShare}
                className="w-full py-3 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg transition-colors duration-200 flex items-center justify-center"
              >
                <svg className="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z"/>
                </svg>
                Share on X
              </button>

              <button
                onClick={handleCopyLink}
                className="w-full py-2 bg-white/20 hover:bg-white/30 text-white font-medium rounded-lg transition-colors duration-200"
              >
                {copied ? 'Link Copied!' : 'Copy Link'}
              </button>
            </div>
          </div>
        </div>

        {/* Footer */}
        <div className="text-center mt-8 space-y-4">
          <button
            onClick={() => router.push('/')}
            className="text-purple-300 hover:text-purple-200 transition-colors duration-200"
          >
            ← Get Your Own Fortune
          </button>
          
          <div className="text-gray-400 text-sm">
            <p>Powered by @Neon_EVM</p>
          </div>
        </div>
      </div>
    </main>
  )
}
