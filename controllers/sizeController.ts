import { PrismaClient } from '@prisma/client';
import express from 'express';

const router = express.Router();

const prisma = new PrismaClient();

router.get('/', async (req, res) => {
    const sizes = await prisma.size.findMany({});
    res.json(sizes);
});

router.get('/:id', async (req, res) => {
    const { id } = req.params;
    const size = await prisma.size.findUnique({
        where: { id: Number(id) },
    });
    if (size !== null) {
        res.json(size);
    } else {
        res.status(400).json({ message: 'No size found' });
    }
});

export default router;
