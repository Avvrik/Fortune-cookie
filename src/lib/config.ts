// Centralized configuration for the application
// Update this file when changing domains or other settings

export const config = {
  // Production domain - update this when deploying to a new domain
  productionDomain: 'https://cookie.neonevm.org',
  
  // Development domain - used for local development
  developmentDomain: 'http://localhost:3003',
  
  // Get the current app URL based on environment
  getAppUrl: (): string => {
    // In production, use the production domain
    if (process.env.NODE_ENV === 'production') {
      return config.productionDomain
    }
    
    // In development, use environment variable or fallback to localhost
    return process.env.NEXT_PUBLIC_APP_URL || config.developmentDomain
  },
  
  // Social media configuration
  social: {
    twitter: {
      site: '@Neon_EVM',
      creator: '@Neon_EVM',
    },
  },
  
  // App metadata
  app: {
    name: 'Mean Crypto Fortune Cookie',
    description: 'Get roasted by the crypto gods with your personalized fortune cookie',
    emoji: '🥠',
  },
} as const

// Export individual configs for convenience
export const { getAppUrl, social, app } = config
