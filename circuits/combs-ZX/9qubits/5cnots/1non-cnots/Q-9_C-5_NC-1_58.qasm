OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[5];
cx q[5], q[6];
z q[0];
cx q[2], q[6];
cx q[2], q[7];
cx q[7], q[2];
