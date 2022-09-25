import React, {useEffect, useState } from 'react';
import { ethers } from 'ethers';

import{ contractABI, contractAddress } from '.../utils/constants';
import { forwardRef } from 'react';

export const TransactionContext = React.createContext();

