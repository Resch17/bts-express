import { PrismaClient } from '@prisma/client';
import express from 'express';

const router = express.Router();

const prisma = new PrismaClient();

router.get('/', async (req, res) => {
    const retailers = await prisma.retailer.findMany({});
    res.json(retailers);
});

router.get('/:id', async (req, res) => {
    const { id } = req.params;
    const retailer = await prisma.retailer.findUnique({
        where: { id: Number(id) },
    });
    if (retailer !== null) {
        res.json(retailer);
    } else {
        res.status(400).json({ message: 'No retailer found' });
    }
});

export default router;
