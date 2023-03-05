OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[2];
cx q[5], q[4];
cx q[0], q[8];
cx q[7], q[0];
