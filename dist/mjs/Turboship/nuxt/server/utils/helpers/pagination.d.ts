import mongoose from 'mongoose';
export declare const blacklistKeys: string[];
export declare const blackListValues: (string | undefined)[];
export declare function buildQuery(params: object): Record<string, any>;
export declare function buildPipeline(query: object, page: number, limit: number): mongoose.PipelineStage[];
