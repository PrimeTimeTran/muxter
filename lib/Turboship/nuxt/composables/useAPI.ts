export function useAPI() {
  const {
    public: { apiUrl, generateUrl },
  } = useRuntimeConfig()
  return { apiUrl, generateUrl }
}
