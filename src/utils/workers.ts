export function escapeWorkerScript(script: string): string {
  return script.replaceAll('${', '$$${').replaceAll('%{', '%%{')
}
