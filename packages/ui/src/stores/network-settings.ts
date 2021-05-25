import createStore from 'zustand';
import { persist } from 'zustand/middleware';
import { StorageConfig } from '@/config/storage';

type TPollingOption = number;
type TState = {
  pollingInterval: TPollingOption;
  shouldFetchData: boolean;

  toggleShouldFetchData: () => void;
  changePollingInterval: (pollingInterval: TPollingOption) => void;
};
export const useNetworkSettingsStore = createStore<TState>(
  persist(
    (set) => ({
      shouldFetchData: true,
      pollingInterval: 5000,

      changePollingInterval: (pollingInterval) => set({ pollingInterval }),
      toggleShouldFetchData: () =>
        set(({ shouldFetchData }) => ({ shouldFetchData: !shouldFetchData })),
    }),
    {
      name: `${StorageConfig.persistNs}network`,
      version: 1,
    },
  ),
);
export const getPollingInterval = () => {
  const interval = useNetworkSettingsStore((state) => state.pollingInterval);
  return interval ? interval : false;
};
