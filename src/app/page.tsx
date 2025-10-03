'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'

interface FortuneResponse {
  slug: string
  shareUrl: string
  image: {
    id: string
    url: string
  }
}

export default function Home() {
  const [handle, setHandle] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [fortune, setFortune] = useState<FortuneResponse | null>(null)
  const router = useRouter()

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!handle.trim()) return

    setLoading(true)
    setError('')

    try {
      const response = await fetch('/api/fortune', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ handle: handle.trim() }),
      })

      const data = await response.json()

      if (!response.ok) {
        throw new Error(data.error || 'Failed to generate fortune')
      }

      setFortune(data)
      // Navigate to the share page
      router.push(`/f/${data.slug}`)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Something went wrong')
    } finally {
      setLoading(false)
    }
  }

  const handleShare = () => {
    if (fortune) {
      const tweetText = `got fortune slapped by @Neon_EVM`
      const shareUrl = encodeURIComponent(fortune.shareUrl)
      const text = encodeURIComponent(tweetText)
      
      window.open(
        `https://twitter.com/intent/tweet?text=${text}&url=${shareUrl}&via=Neon_EVM`,
        '_blank'
      )
    }
  }

  return (
    <main className="min-h-screen bg-gradient-to-br from-purple-900 via-blue-900 to-indigo-900 flex items-center justify-center p-4">
      <div className="max-w-md w-full">
        {/* Header */}
        <div className="text-center mb-8">
          <h1 className="text-4xl font-bold text-white mb-2">
            Mean Crypto Fortune Cookie
          </h1>
          <p className="text-gray-300">
            Enter your X handle and get roasted by the crypto gods
          </p>
        </div>

        {/* Form */}
        <div className="bg-white/10 backdrop-blur-sm rounded-xl p-6 shadow-xl">
          {!fortune ? (
            <form onSubmit={handleSubmit} className="space-y-4">
              <div>
                <label htmlFor="handle" className="block text-sm font-medium text-gray-300 mb-2">
                  X Handle
                </label>
                <input
                  type="text"
                  id="handle"
                  value={handle}
                  onChange={(e) => setHandle(e.target.value)}
                  placeholder="@vitalik"
                  className="w-full px-4 py-3 bg-white/20 border border-white/30 rounded-lg text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-transparent"
                  disabled={loading}
                />
                <p className="text-xs text-gray-400 mt-1">
                  Enter without the @ symbol
                </p>
              </div>

              {error && (
                <div className="p-3 bg-red-500/20 border border-red-500/50 rounded-lg">
                  <p className="text-red-200 text-sm">{error}</p>
                </div>
              )}

              <button
                type="submit"
                disabled={loading || !handle.trim()}
                className="w-full py-3 bg-gradient-to-r from-purple-600 to-pink-600 hover:from-purple-700 hover:to-pink-700 disabled:from-gray-600 disabled:to-gray-700 text-white font-semibold rounded-lg transition-all duration-200 disabled:cursor-not-allowed"
              >
                {loading ? (
                  <div className="flex items-center justify-center">
                    <div className="animate-spin rounded-full h-5 w-5 border-b-2 border-white mr-2"></div>
                    Generating...
                  </div>
                ) : (
                  'Tell me'
                )}
              </button>
            </form>
          ) : (
            <div className="space-y-4">
              <div className="text-center">
                <img
                  src={fortune.image.url}
                  alt="Fortune cookie"
                  className="w-32 h-32 mx-auto rounded-lg shadow-lg"
                />
                <p className="text-white mt-4 text-lg">
                  @{handle}'s fortune is ready!
                </p>
              </div>

              <button
                onClick={handleShare}
                className="w-full py-3 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg transition-colors duration-200"
              >
                Share on X
              </button>

              <button
                onClick={() => {
                  setFortune(null)
                  setHandle('')
                  setError('')
                }}
                className="w-full py-2 text-gray-300 hover:text-white transition-colors duration-200"
              >
                Generate Another
              </button>
            </div>
          )}
        </div>

        {/* Footer */}
        <div className="text-center mt-8 text-gray-400 text-sm">
          <p>Powered by @Neon_EVM</p>
        </div>
      </div>
    </main>
  )
}