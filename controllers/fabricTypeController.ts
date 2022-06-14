import { PrismaClient } from '@prisma/client';
import express from 'express';

const router = express.Router();

const prisma = new PrismaClient();

router.get('/', async (req, res) => {
    const fabrictypes = await prisma.fabrictype.findMany({});
    res.json(fabrictypes);
});

router.get('/:id', async (req, res) => {
    const { id } = req.params;
    const fabrictype = await prisma.fabrictype.findUnique({
        where: { id: Number(id) },
    });
    if (fabrictype !== null) {
        res.json(fabrictype);
    } else {
        res.status(400).json({ message: 'No category found' });
    }
});

export default router;