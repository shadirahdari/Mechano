import { Event } from './Event';
import { ExecutionContext } from '../types/ExecutionContext';

export abstract class EventMessageSerializer {
  abstract serialize(event: Event, context?: ExecutionContext): string;
  abstract deserialize(event: string): Event;
}
