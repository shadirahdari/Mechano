import { Newable } from 'ts-essentials';
import { Event } from './Event';

export type EventCtor<TEvent extends Event> = Newable<TEvent>;
