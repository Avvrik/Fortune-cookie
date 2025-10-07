import Link from 'next/link'

export default function NotFound() {
  return (
    <main className="min-h-screen bg-gradient-to-br from-purple-900 via-blue-900 to-indigo-900 flex items-center justify-center p-4">
      <div className="max-w-md w-full text-center">
        <div className="bg-white/10 backdrop-blur-sm rounded-xl p-8 shadow-xl">
          <h1 className="text-4xl font-bold text-white mb-4">404</h1>
          <p className="text-gray-300 mb-6">
            This fortune doesn&apos;t exist or has been deleted.
          </p>
          <Link
            href="/"
            className="inline-block py-3 px-6 bg-gradient-to-r from-purple-600 to-pink-600 hover:from-purple-700 hover:to-pink-700 text-white font-semibold rounded-lg transition-all duration-200"
          >
            Draw another
          </Link>
        </div>
        
        <div className="text-center mt-8 text-gray-400 text-sm">
          <p>Powered by @Neon_EVM</p>
        </div>
      </div>
    </main>
  )
}
