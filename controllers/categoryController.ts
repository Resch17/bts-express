import { PrismaClient } from '@prisma/client';
import express from 'express';

const router = express.Router();

const prisma = new PrismaClient();

router.get('/', async (req, res) => {
    const categories = await prisma.category.findMany({});
    res.json(categories);
});

router.get('/:id', async (req, res) => {
    const { id } = req.params;
    const category = await prisma.category.findUnique({
        where: { id: Number(id) },
    });
    if (category !== null) {
        res.json(category);
    } else {
        res.status(400).json({ message: 'No category found' });
    }
});

export default router;
